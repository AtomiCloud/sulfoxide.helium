{ pkgs, packages }:
with packages;
{
  system = [
    coreutils
    sd
    bash
    jq
    yq-go
  ];

  dev = [
    pls
    git
    skopeo
  ];

  infra = [
    k3d
    helm
    kubectl
  ];

  main = [
    infisical
  ];

  lint = [
    # core
    treefmt

    helm-docs

    gitlint
    shellcheck
  ];

  releaser = [
    sg
  ];
}
