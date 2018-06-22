cmake_minimum_required(VERSION 2.8.3)
project(face_detection)

find_package(
  catkin REQUIRED COMPONENTS
  roscpp
  rospy
  cv_bridge
  std_msgs
  image_transport
  genmsg
  message_generation
  sensor_msgs
)

find_package(OpenCV REQUIRED)

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
add_dependencies(face_detection_server ${${PROJECT_NAME}_EXPORTED_TARGETS})

add_executable(face_detection_client src/face_detection_client.cpp)
target_link_libraries(face_detection_client ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
add_dependencies(face_detection_client ${${PROJECT_NAME}_EXPORTED_TARGETS})
