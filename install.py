import os

def shell(cmd):
    print(cmd)
    status_code = os.system(cmd)
    
    if status_code != 0:
        exit(status_code)

shell("helm upgrade --install --create-namespace --namespace monitoring loki charts/loki")
shell("helm upgrade --install --create-namespace --namespace monitoring grafana-exposer charts/exposer --values charts/exposer/grafana.yaml")