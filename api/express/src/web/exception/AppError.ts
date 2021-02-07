export default class AppError {
  constructor(public message: string, public statusCode: number = 400) {}
}
