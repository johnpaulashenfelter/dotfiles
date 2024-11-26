{{- if (eq .chezmoi.os "darwin") -}}
#!/bin/bash

# Install/upgrade mise

{{- if or (lt 30 (atoi (env "SCRIPTS_START_AT"))) (env "SKIP_MISE") }}
echo "Skip installing mise"
exit 0
{{ else }}
echo "Install/upgrade mise"
{{- end }}

if [[ ! $(command -v mise) ]]; then
  curl https://mise.run | sh
else
  mise self-update -y
fi

{{ end -}}
