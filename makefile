# login: admin
# https://www.metricfire.com/blog/top-10-cadvisor-metrics-for-prometheus/
# https://grafana.com/docs/loki/latest/logql/log_queries/

context:
	kubectl config set-context --current --namespace=${c}

grafana_password:
	set -x
	kubectl get secret --namespace=monitoring loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

grafana_connect:
	set -x
	kubectl port-forward --namespace=monitoring service/loki-grafana 30001:80

prometheus_connect:
	set -x
	kubectl port-forward --namespace=monitoring service/loki-prometheus-server 30002:80

