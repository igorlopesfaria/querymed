enum Environment {
  prod("https://bff.doctorline.com.br/api"),
  staging("https://bff.staging.doctorline.com.br/api"),
  mock("http://192.168.15.93:3002");

  const Environment(this.baseUrl);

  final String baseUrl;
}
