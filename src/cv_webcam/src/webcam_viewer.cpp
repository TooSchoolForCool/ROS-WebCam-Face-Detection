#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <cv_bridge/cv_bridge.h>

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

    cv::imshow("webcam", cv_img_ptr->image);
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