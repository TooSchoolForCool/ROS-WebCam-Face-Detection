#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <face_detection/FaceDetection.h>
#include <face_detection/BoundingBox.h>
#include "opencv2/objdetect.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"

using namespace std;
using namespace cv;

#define FACE_CASCADE_PATH "/media/psf/ROS-WebCam-Face-Detection/src/cv_webcam/assets/haarcascade_frontalface_alt2.xml"

vector<Rect> detect(const Mat &frame)
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

    return faces;
}

bool detect_faces(face_detection::FaceDetection::Request &req,
    face_detection::FaceDetection::Response &res)
{
    cv_bridge::CvImagePtr cv_img_ptr = cv_bridge::toCvCopy(req.image, 
        sensor_msgs::image_encodings::BGR8);

    vector<Rect> rects = detect(cv_img_ptr->image);

    for(size_t i = 0; i < rects.size(); i++) {
        face_detection::BoundingBox bb;

        bb.x = rects[i].tl().x;
        bb.y = rects[i].tl().y;
        bb.width = rects[i].width;
        bb.height = rects[i].height;
        
        res.faces.push_back(bb);
    }

    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "face_detection_server");
    ros::NodeHandle nh;

    ros::ServiceServer service = nh.advertiseService("face_detection", detect_faces);
    ROS_INFO("Ready to detect faces.");
    ros::spin();

    return 0;
}