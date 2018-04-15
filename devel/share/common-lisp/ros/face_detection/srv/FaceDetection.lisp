; Auto-generated. Do not edit!


(cl:in-package face_detection-srv)


;//! \htmlinclude FaceDetection-request.msg.html

(cl:defclass <FaceDetection-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass FaceDetection-request (<FaceDetection-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FaceDetection-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FaceDetection-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name face_detection-srv:<FaceDetection-request> is deprecated: use face_detection-srv:FaceDetection-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <FaceDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detection-srv:image-val is deprecated.  Use face_detection-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FaceDetection-request>) ostream)
  "Serializes a message object of type '<FaceDetection-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FaceDetection-request>) istream)
  "Deserializes a message object of type '<FaceDetection-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FaceDetection-request>)))
  "Returns string type for a service object of type '<FaceDetection-request>"
  "face_detection/FaceDetectionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceDetection-request)))
  "Returns string type for a service object of type 'FaceDetection-request"
  "face_detection/FaceDetectionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FaceDetection-request>)))
  "Returns md5sum for a message object of type '<FaceDetection-request>"
  "9e11f7c32366b1699aeacc362886f630")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FaceDetection-request)))
  "Returns md5sum for a message object of type 'FaceDetection-request"
  "9e11f7c32366b1699aeacc362886f630")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FaceDetection-request>)))
  "Returns full string definition for message of type '<FaceDetection-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FaceDetection-request)))
  "Returns full string definition for message of type 'FaceDetection-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FaceDetection-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FaceDetection-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FaceDetection-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude FaceDetection-response.msg.html

(cl:defclass <FaceDetection-response> (roslisp-msg-protocol:ros-message)
  ((faces
    :reader faces
    :initarg :faces
    :type (cl:vector face_detection-msg:BoundingBox)
   :initform (cl:make-array 0 :element-type 'face_detection-msg:BoundingBox :initial-element (cl:make-instance 'face_detection-msg:BoundingBox))))
)

(cl:defclass FaceDetection-response (<FaceDetection-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FaceDetection-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FaceDetection-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name face_detection-srv:<FaceDetection-response> is deprecated: use face_detection-srv:FaceDetection-response instead.")))

(cl:ensure-generic-function 'faces-val :lambda-list '(m))
(cl:defmethod faces-val ((m <FaceDetection-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader face_detection-srv:faces-val is deprecated.  Use face_detection-srv:faces instead.")
  (faces m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FaceDetection-response>) ostream)
  "Serializes a message object of type '<FaceDetection-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'faces))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'faces))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FaceDetection-response>) istream)
  "Deserializes a message object of type '<FaceDetection-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'faces) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'faces)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'face_detection-msg:BoundingBox))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FaceDetection-response>)))
  "Returns string type for a service object of type '<FaceDetection-response>"
  "face_detection/FaceDetectionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceDetection-response)))
  "Returns string type for a service object of type 'FaceDetection-response"
  "face_detection/FaceDetectionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FaceDetection-response>)))
  "Returns md5sum for a message object of type '<FaceDetection-response>"
  "9e11f7c32366b1699aeacc362886f630")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FaceDetection-response)))
  "Returns md5sum for a message object of type 'FaceDetection-response"
  "9e11f7c32366b1699aeacc362886f630")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FaceDetection-response>)))
  "Returns full string definition for message of type '<FaceDetection-response>"
  (cl:format cl:nil "BoundingBox[] faces~%~%================================================================================~%MSG: face_detection/BoundingBox~%int64 x~%int64 y~%int64 width~%int64 height~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FaceDetection-response)))
  "Returns full string definition for message of type 'FaceDetection-response"
  (cl:format cl:nil "BoundingBox[] faces~%~%================================================================================~%MSG: face_detection/BoundingBox~%int64 x~%int64 y~%int64 width~%int64 height~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FaceDetection-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'faces) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FaceDetection-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FaceDetection-response
    (cl:cons ':faces (faces msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FaceDetection)))
  'FaceDetection-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FaceDetection)))
  'FaceDetection-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceDetection)))
  "Returns string type for a service object of type '<FaceDetection>"
  "face_detection/FaceDetection")