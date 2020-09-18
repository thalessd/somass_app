class ClientDataDto {
  String fullName;
  List<String> escorts;
  String deviceInfoOs;
  String deviceInfoBrand;
  String deviceInfoModel;
  String deviceInfoPhysicalDevice;
  String deviceInfoDisplay;

  ClientDataDto(
      {this.fullName,
      this.escorts,
      this.deviceInfoOs,
      this.deviceInfoBrand,
      this.deviceInfoModel,
      this.deviceInfoPhysicalDevice,
      this.deviceInfoDisplay});

  Map<String, dynamic> toMap() {
    return {
      if (this.fullName != null) "fullName": this.fullName,
      if (this.escorts != null) "escorts": this.escorts,
      if (this.deviceInfoOs != null) "deviceInfoOs": this.deviceInfoOs,
      if (this.deviceInfoBrand != null) "deviceInfoBrand": this.deviceInfoBrand,
      if (this.deviceInfoModel != null) "deviceInfoModel": this.deviceInfoModel,
      if (this.deviceInfoPhysicalDevice != null) "deviceInfoPhysicalDevice": this.deviceInfoPhysicalDevice,
      if (this.deviceInfoDisplay != null) "deviceInfoDisplay": this.deviceInfoDisplay,
    };
  }
}
