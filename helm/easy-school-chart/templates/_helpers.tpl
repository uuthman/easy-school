{{- define "easy-school.labels" -}}
app: easy-school
env: {{ .Values.app.env  }}
{{- end -}}

{{- define  "easy-school.namespace" -}}
two-tier-{{ .Values.app.env}}
{{- end -}}