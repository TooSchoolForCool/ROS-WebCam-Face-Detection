// Generated by gencpp from file face_detection/FaceDetection.msg
// DO NOT EDIT!


#ifndef FACE_DETECTION_MESSAGE_FACEDETECTION_H
#define FACE_DETECTION_MESSAGE_FACEDETECTION_H

#include <ros/service_traits.h>


#include <face_detection/FaceDetectionRequest.h>
#include <face_detection/FaceDetectionResponse.h>


namespace face_detection
{

struct FaceDetection
{

typedef FaceDetectionRequest Request;
typedef FaceDetectionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct FaceDetection
} // namespace face_detection


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::face_detection::FaceDetection > {
  static const char* value()
  {
    return "9e11f7c32366b1699aeacc362886f630";
  }

  static const char* value(const ::face_detection::FaceDetection&) { return value(); }
};

template<>
struct DataType< ::face_detection::FaceDetection > {
  static const char* value()
  {
    return "face_detection/FaceDetection";
  }

  static const char* value(const ::face_detection::FaceDetection&) { return value(); }
};


// service_traits::MD5Sum< ::face_detection::FaceDetectionRequest> should match 
// service_traits::MD5Sum< ::face_detection::FaceDetection > 
template<>
struct MD5Sum< ::face_detection::FaceDetectionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::face_detection::FaceDetection >::value();
  }
  static const char* value(const ::face_detection::FaceDetectionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::face_detection::FaceDetectionRequest> should match 
// service_traits::DataType< ::face_detection::FaceDetection > 
template<>
struct DataType< ::face_detection::FaceDetectionRequest>
{
  static const char* value()
  {
    return DataType< ::face_detection::FaceDetection >::value();
  }
  static const char* value(const ::face_detection::FaceDetectionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::face_detection::FaceDetectionResponse> should match 
// service_traits::MD5Sum< ::face_detection::FaceDetection > 
template<>
struct MD5Sum< ::face_detection::FaceDetectionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::face_detection::FaceDetection >::value();
  }
  static const char* value(const ::face_detection::FaceDetectionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::face_detection::FaceDetectionResponse> should match 
// service_traits::DataType< ::face_detection::FaceDetection > 
template<>
struct DataType< ::face_detection::FaceDetectionResponse>
{
  static const char* value()
  {
    return DataType< ::face_detection::FaceDetection >::value();
  }
  static const char* value(const ::face_detection::FaceDetectionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // FACE_DETECTION_MESSAGE_FACEDETECTION_H
