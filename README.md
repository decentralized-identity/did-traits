# DID Traits

[Latest Editor's Draft](https://identity.foundation/did-traits/)

This document guides implementers of [W3C Decentralized Identifiers (DIDs)](https://w3c.github.io/did-core/) in
selecting suitable DID methods for their specific use cases by defining proven and relevant Decentralized Identifiers
traits. It includes a JSON schema for representing traits of a concrete DID method in a structured, machine-readable
format, enabling integration with third-party systems such as DID resolvers..

## Known Implementations

| Name                                                                               | Description                                                                        | Author                                 |
| ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | -------------------------------------- |
| [Universal Resolver](https://github.com/decentralized-identity/universal-resolver) | Experimental support for returning DID Traits documents via the Universal Resolver | [Danube Tech](https://danubetech.com/) |

## Edit Specification

```
git clone git@github.com:decentralized-identity/did-traits.git
npm i
npm run edit
npx serve build
```

Visit <http://localhost:5000/>
