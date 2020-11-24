export default interface TokenProvider {
  generateToken(userId: string): Promise<string>;
}
