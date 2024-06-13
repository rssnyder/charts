{{/*
Expand the name of the chart.
*/}}
{{- define "harness-ccm-autostopping.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "harness-ccm-autostopping.fullname" -}}
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
{{- define "harness-ccm-autostopping.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "harness-ccm-autostopping.labels" -}}
helm.sh/chart: {{ include "harness-ccm-autostopping.chart" . }}
app.kubernetes.io/name: {{ include "harness-ccm-autostopping.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for controller
*/}}
{{- define "harness-ccm-autostopping.controller.selectorLabels" -}}
app.kubernetes.io/component: {{ include "harness-ccm-autostopping.name" . }}-controller
{{- end }}

{{/*
Selector labels for router
*/}}
{{- define "harness-ccm-autostopping.router.selectorLabels" -}}
app.kubernetes.io/component: {{ include "harness-ccm-autostopping.name" . }}-router
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "harness-ccm-autostopping.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "harness-ccm-autostopping.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define resource names
*/}}
{{- define "harness-ccm-autostopping.controller.name" -}}
{{- include "harness-ccm-autostopping.fullname" . }}-controller
{{- end }}
{{- define "harness-ccm-autostopping.router.name" -}}
{{- include "harness-ccm-autostopping.fullname" . }}-router
{{- end }}

{{/*
Define the api token name
*/}}
{{- define "ff-proxy.apiToken" -}}
{{- if not .Values.existingApiToken }}
{{- include "ff-proxy.fullname" . }}
{{- else }}
{{- .Values.existingApiToken | trunc 63 | toString }}
{{- end }}
{{- end }}