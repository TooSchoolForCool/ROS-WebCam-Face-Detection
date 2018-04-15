#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include "opencv2/objdetect.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include <cv_bridge/cv_bridge.h>

using namespace std;
using namespace cv;

#define FACE_CASCADE_PATH "/media/psf/ROS-WebCam-Face-Detection/src/cv_webcam/assets/haarcascade_frontalface_alt2.xml"

void face_detection(Mat &frame)
{
    CascadeClassifier face_cascade;
    if( !face_cascade.load(FACE_CASCADE_PATH) ) {
        ROS_ERROR("[ERROR] Cannot load file: %s", FACE_CASCADE_PATH);
        exit(1);
    }

    vector<Rect> faces;
    Mat frame_gray;
    cvtColor( frame, frame_gray, COLOR_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );

    face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CASCADE_SCALE_IMAGE, Size(30, 30) );

    for(size_t i = 0; i < faces.size(); i++) {
        rectangle(frame, faces[i], CV_RGB(0, 255,0), 3);
    }
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

    Mat detected_frame(cv_img_ptr->image);
    face_detection(detected_frame);

    cv::imshow("webcam", detected_frame);
    cv::waitKey(1);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "webcam_viewer");
    ros::NodeHandle nh;

    image_transport::ImageTransport it(nh);
    image_transport::Subscriber sub = it.subscribe("webcam_frame", 1, viewerCallback);

    ros::spin();
    return 0;
}