{{/*
Expand the name of the chart.
*/}}
{{- define "sulfoxide-helium.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sulfoxide-helium.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sulfoxide-helium.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sulfoxide-helium.labels" -}}
helm.sh/chart: {{ include "sulfoxide-helium.chart" . }}
{{- range $k, $v := .Values.serviceTree }}
"atomi.cloud/{{ $k }}": "{{ $v }}"
{{- end }}
{{ include "sulfoxide-helium.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common annotations
*/}}
{{- define "sulfoxide-helium.annotations" -}}
helm.sh/chart: {{ include "sulfoxide-helium.chart" . }}
{{- range $k, $v := .Values.serviceTree }}
"atomi.cloud/{{ $k }}": "{{ $v }}"
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sulfoxide-helium.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sulfoxide-helium.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sulfoxide-helium.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sulfoxide-helium.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}