#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <cv_bridge/cv_bridge.h>


int main(int argc, char **argv)
{
	ros::init(argc, argv, "cv_webcam");
	ros::NodeHandle nh;

	image_transport::ImageTransport it(nh);
	image_transport::Publisher pub = it.advertise("webcam_frame", 1);

	cv::VideoCapture cap(0);
	if( !cap.isOpened() ) {
		ROS_INFO("[ERROR]: Cannot open webcam");
		return 1;
	}

	cv::Mat frame;
	sensor_msgs::ImagePtr msg;

	ros::Rate loop_rate(30);

	while( nh.ok() ) {
		cap >> frame;

		if( !frame.empty() ) {
			msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
			pub.publish(msg);
		}

		ros::spinOnce();
		loop_rate.sleep();
	}

	return 0;
}