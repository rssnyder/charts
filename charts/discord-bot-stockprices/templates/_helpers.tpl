{{/*
Expand the name of the chart.
*/}}
{{- define "discord-bot-stockprices.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "discord-bot-stockprices.fullname" -}}
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
{{- define "discord-bot-stockprices.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "discord-bot-stockprices.labels" -}}
helm.sh/chart: {{ include "discord-bot-stockprices.chart" . }}
{{ include "discord-bot-stockprices.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "discord-bot-stockprices.selectorLabels" -}}
app.kubernetes.io/name: {{ include "discord-bot-stockprices.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Define the token name
*/}}
{{- define "discord-bot-stockprices.token" -}}
{{- if not .Values.existingToken }}
{{- include "discord-bot-stockprices.fullname" . }}
{{- else }}
{{- .Values.existingToken | trunc 63 | toString }}
{{- end }}
{{- end }}
