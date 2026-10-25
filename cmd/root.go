package cmd

import (
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "app-template",
	Short: "Go + Refine 应用骨架",
	Long:  "单二进制应用模板：契约生成管理 API、Cookie 会话管理台、嵌入 SPA、CLI 生命周期。",
}

// Execute 执行根命令。
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		os.Exit(1)
	}
}
