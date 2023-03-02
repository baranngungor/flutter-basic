class UserRequests {
  static loginRequest(token, clientDeviceId, email, password) => {
        "client_device_id": "$clientDeviceId",
        "email": "$email",
        "password": "$password",
      };
}
