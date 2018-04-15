#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <face_detection/FaceDetection.h>
#include <face_detection/BoundingBox.h>
#include "opencv2/objdetect.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"

ros::ServiceClient *client_ptr; //pointer for a client

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

    face_detection::FaceDetection srv;
    srv.request.image = *msg;

    if( client_ptr->call(srv) ) {
        for(size_t i = 0; i < srv.response.faces.size(); i++) {
            int x = srv.response.faces[i].x;
            int y = srv.response.faces[i].y;
            int width = srv.response.faces[i].width;
            int height = srv.response.faces[i].height;

            cv::Rect rect(x, y, width, height);
            cv::rectangle(detected_frame, rect, CV_RGB(0, 255,0), 3);
        }
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