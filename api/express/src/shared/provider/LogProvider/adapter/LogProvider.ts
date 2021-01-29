export default interface LogProvider {
  info(message: string, error?: Error): Promise<void>;
  error(message: string, error?: Error): Promise<void>;
}
