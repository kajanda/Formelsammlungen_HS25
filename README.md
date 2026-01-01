# ZHAW Zusammenfassungen

This repository contains summaries for various ZHAW courses written in Typst.

## Previewing Typst Documents in VS Code

To preview Typst documents in VS Code, you need the Tinymist Typst extension:

1. **Install the extension**:
   - Open the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X` on macOS)
   - Search for "Tinymist Typst"
   - Install the extension by Myriad-Dreamin

2. **Preview a document**:
   - Open any `.typ` file
   - Click the preview icon in the top-right corner of the editor
   - Or use the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on macOS) and type "Typst Preview"
   - Or use the keyboard shortcut `Ctrl+K V` (on macOS: `Cmd+K V`)
   - The preview will open in a split pane and update automatically as you edit

3. **Automatic PDF Export**:
   - PDFs are automatically generated when you save `.typ` files
   - The workspace is configured to export PDFs on save (see `.vscode/settings.json`)
   - PDFs are created in the same directory as the source files
   - Manual export is also available via "Typst: Export PDF" from the command palette or the export icon in the editor toolbar

## Structure

- **HM/**: Höhere Mathematik
- **STS/**: Stochastik & Statistik 
