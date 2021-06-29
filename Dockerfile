  1 FROM alpine
  2
  3 MAINTAINER Kevin McDermott <bigkevmcd@gmail.com>
  4
  5 ENV KUBE_LATEST_VERSION="v1.21.2"
  6
  7 RUN apk add --update ca-certificates \
  8  && apk add --update -t deps curl bash git openssh \
  9  && apk add --update bash git openssh \
 10  && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 11  && chmod +x /usr/local/bin/kubectl \
 12  && curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash \
 13  && apk del --purge deps \
 14  && rm /var/cache/apk/*
 15
 16 ENTRYPOINT ["kubectl"]
 17 CMD ["help"]
