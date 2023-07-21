enum ContentType {
  json('application/json'),
  multipart('multipart/form-data');

  const ContentType(this.name);

  final String name;
}
