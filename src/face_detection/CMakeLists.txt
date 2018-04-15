cmake_minimum_required(VERSION 2.8.3)
project(face_detection)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  cv_bridge
  std_msgs
  image_transport
  OpenCV
  genmsg
  message_generation
  sensor_msgs
)

add_message_files(
  FILES
  BoundingBox.msg
)

add_service_files(
    FILES
    FaceDetection.srv
)

generate_messages(
    DEPENDENCIES
    std_msgs
    sensor_msgs
)


catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

add_executable(face_detection_server src/face_detection_server.cpp)
target_link_libraries(face_detection_server ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

install(TARGETS face_detection_server
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

add_executable(face_detection_client src/face_detection_client.cpp)
target_link_libraries(face_detection_client ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

install(TARGETS face_detection_client
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})