export default interface StorageService {
  saveFile(file: string): Promise<string>;
  deleteFile(file: string): Promise<void>;
}
