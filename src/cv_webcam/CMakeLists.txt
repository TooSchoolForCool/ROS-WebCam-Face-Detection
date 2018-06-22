cmake_minimum_required(VERSION 2.8.3)
project(cv_webcam)

find_package(
    catkin REQUIRED COMPONENTS
    roscpp
    rospy
    cv_bridge
    image_transport
    std_msgs
)

find_package(OpenCV REQUIRED)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

add_executable(webcam_driver src/webcam_driver.cpp)
target_link_libraries(webcam_driver ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

add_executable(webcam_viewer src/webcam_viewer.cpp)
target_link_libraries(webcam_viewer ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

install(TARGETS webcam_driver
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(TARGETS webcam_viewer
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})