#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <face_detection/FaceDetection.h>
#include <face_detection/BoundingBox.h>
#include "opencv2/objdetect.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include <iostream>

using namespace std;
using namespace cv;

//pointer for a client
ros::ServiceClient *client_ptr; 


bool compareCvRect(const cv::Rect &a, const cv::Rect &b)
{
    return a.area() > b.area();
}


void NMS(std::vector<cv::Rect> &rois, double overlap_threshold)
{
    if( rois.empty() )
        return;

    // initilize picked-up region vector, where we store the NMS result
    vector<Rect> pick;

    sort(rois.begin(), rois.end(), compareCvRect);

    while( !rois.empty() ){
        // At the begining of each iteration, choose the last
        // bounding box as the picked-up region and push it into 
        // the pick vector. Then erase the picked-up last one in 
        // the rois vector.
        cv::Rect cur_rect = rois[rois.size() - 1];
        pick.push_back(cur_rect);
        rois.erase(rois.end() - 1);

        std::vector<cv::Rect>::iterator iter = rois.begin();
        while(iter != rois.end()){
            // find the overlap bounding box top-left & bottom-right coordinates
            int overlap_x1 = max(cur_rect.tl().x, iter->tl().x);
            int overlap_y1 = max(cur_rect.tl().y, iter->tl().y);
            int overlap_x2 = min(cur_rect.br().x, iter->br().x);
            int overlap_y2 = min(cur_rect.br().y, iter->br().y);

            // compute the width and height of the overlap between
            // computed bounding box(cur_rect) and the bounding box(iter)
            int overlap_width = max(0, overlap_x2 - overlap_x1 + 1);
            int overlap_height = max(0, overlap_y2 - overlap_y1 + 1);

            // compute the ratio of overlap between the computed
            // bounding box(cur_rect) and the bounding box(iter) in the rois
            double overlap_area = (float)(overlap_width * overlap_height);
            double overlap_rate = max(overlap_area / cur_rect.area(), overlap_area / iter->area());
            
            // if there is sufficient overlap, suppress the
            // current bounding box(iter)
            if(overlap_rate > overlap_threshold)
                iter = rois.erase(iter);
            else
                iter++;
        }
    }

    // update the region of interests
    rois.swap(pick);
}


void viewerCallback(const sensor_msgs::ImageConstPtr &msg)
{
    cv_bridge::CvImagePtr cv_img_ptr;

    try{
        cv_img_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    } 
    catch (cv_bridge::Exception& e) {  
        ROS_ERROR("[ERROR] cv_bridge exception: %s", e.what());  
        return;
    }

    cv::Mat detected_frame(cv_img_ptr->image);
    flip(detected_frame, detected_frame, 1);

    // Call face_detection service
    face_detection::FaceDetection srv;
    srv.request.image = *msg;

    if( client_ptr->call(srv) ) {
        std::vector<cv::Rect> rois;
        for(size_t i = 0; i < srv.response.faces.size(); i++) {
            cv::Rect rect(srv.response.faces[i].x, srv.response.faces[i].y, 
                srv.response.faces[i].width, srv.response.faces[i].height);
            rois.push_back(rect);
        }

        NMS(rois, 0.5);

        for(size_t i = 0; i < rois.size(); i++)
            cv::rectangle(detected_frame, rois[i], CV_RGB(0, 255,0), 3);  
    }

    cv::imshow("webcam", detected_frame);
    cv::waitKey(1);
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "face_detection_client");
    ros::NodeHandle nh;

    ros::ServiceClient client = nh.serviceClient<face_detection::FaceDetection>("face_detection");
    client_ptr = &client;

    image_transport::ImageTransport it(nh);
    image_transport::Subscriber sub = it.subscribe("image", 1, viewerCallback);

    ros::spin();
    return 0;
}