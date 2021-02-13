pandoc -o report.docx --filter pandoc-crossref report.md
pandoc -o report.pdf --filter pandoc-crossref report.md
pandoc -o report.pptx --filter pandoc-crossref report.md