;; Auto-generated. Do not edit!


(when (boundp 'face_detection::FaceDetection)
  (if (not (find-package "FACE_DETECTION"))
    (make-package "FACE_DETECTION"))
  (shadow 'FaceDetection (find-package "FACE_DETECTION")))
(unless (find-package "FACE_DETECTION::FACEDETECTION")
  (make-package "FACE_DETECTION::FACEDETECTION"))
(unless (find-package "FACE_DETECTION::FACEDETECTIONREQUEST")
  (make-package "FACE_DETECTION::FACEDETECTIONREQUEST"))
(unless (find-package "FACE_DETECTION::FACEDETECTIONRESPONSE")
  (make-package "FACE_DETECTION::FACEDETECTIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass face_detection::FaceDetectionRequest
  :super ros::object
  :slots (_image ))

(defmethod face_detection::FaceDetectionRequest
  (:init
   (&key
    ((:image __image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _image __image)
   self)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;;
   self)
  )

(defclass face_detection::FaceDetectionResponse
  :super ros::object
  :slots (_faces ))

(defmethod face_detection::FaceDetectionResponse
  (:init
   (&key
    ((:faces __faces) (let (r) (dotimes (i 0) (push (instance face_detection::BoundingBox :init) r)) r))
    )
   (send-super :init)
   (setq _faces __faces)
   self)
  (:faces
   (&rest __faces)
   (if (keywordp (car __faces))
       (send* _faces __faces)
     (progn
       (if __faces (setq _faces (car __faces)))
       _faces)))
  (:serialization-length
   ()
   (+
    ;; face_detection/BoundingBox[] _faces
    (apply #'+ (send-all _faces :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; face_detection/BoundingBox[] _faces
     (write-long (length _faces) s)
     (dolist (elem _faces)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; face_detection/BoundingBox[] _faces
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _faces (let (r) (dotimes (i n) (push (instance face_detection::BoundingBox :init) r)) r))
     (dolist (elem- _faces)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass face_detection::FaceDetection
  :super ros::object
  :slots ())

(setf (get face_detection::FaceDetection :md5sum-) "9e11f7c32366b1699aeacc362886f630")
(setf (get face_detection::FaceDetection :datatype-) "face_detection/FaceDetection")
(setf (get face_detection::FaceDetection :request) face_detection::FaceDetectionRequest)
(setf (get face_detection::FaceDetection :response) face_detection::FaceDetectionResponse)

(defmethod face_detection::FaceDetectionRequest
  (:response () (instance face_detection::FaceDetectionResponse :init)))

(setf (get face_detection::FaceDetectionRequest :md5sum-) "9e11f7c32366b1699aeacc362886f630")
(setf (get face_detection::FaceDetectionRequest :datatype-) "face_detection/FaceDetectionRequest")
(setf (get face_detection::FaceDetectionRequest :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
BoundingBox[] faces

================================================================================
MSG: face_detection/BoundingBox
int64 x
int64 y
int64 width
")

(setf (get face_detection::FaceDetectionResponse :md5sum-) "9e11f7c32366b1699aeacc362886f630")
(setf (get face_detection::FaceDetectionResponse :datatype-) "face_detection/FaceDetectionResponse")
(setf (get face_detection::FaceDetectionResponse :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
BoundingBox[] faces

================================================================================
MSG: face_detection/BoundingBox
int64 x
int64 y
int64 width
")



(provide :face_detection/FaceDetection "9e11f7c32366b1699aeacc362886f630")


