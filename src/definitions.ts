export interface LocationCheckerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
