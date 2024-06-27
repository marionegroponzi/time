
# Mojo
Ref.: https://medium.com/@maicmi/install-mojo-on-mac-m1-and-run-python-integration-with-no-crash-d730e9965d60

## Certificate
`cat ~/certs/TIAROOTCA2022.pem >> ~/.modular/pkg/packages.modular.com_mojo/venv/lib/python3.12/site-packages/pip/_vendor/certifi/cacert.pem`

## Create env (if not availalbe)
`python3 -m venv mojo-venv`

## Activate
`source mojo-venv/bin/activate`

## Run
`mojo hello.mojo`

## Build
`mojo build hello.mojo`