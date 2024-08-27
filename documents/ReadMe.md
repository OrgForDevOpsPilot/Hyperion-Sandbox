# This is ReadMe Top Page

# Azure DevOps-Sharepoint設計書連携処理
::: mermaid
graph TD
    A[Azure DevOps Repository] -->|Markdownファイル| B[Azure Pipelines]
    B -->|PDFに変換| C[Build.ArtifactStagingDirectory]
    C -->|PDFファイルを格納| D[Azure Blob Storage]
    D -->|PDFファイルをコピー| E[SharePoint]
    
    subgraph ConvertAndUpload Job
        B --> F[Markdown to PDF Conversion]
        F --> G[Copy PDF Files]
        G --> H[Publish Build Artifacts]
        H --> I[Upload to Azure Blob Storage]
        I --> J[Upload to SharePoint using PowerShell]
    end

:::
