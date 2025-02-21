export interface LocationCheckerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  checkPermission(): Promise<{ status: string }>;
}
