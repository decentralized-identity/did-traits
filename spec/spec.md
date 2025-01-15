# DID Traits 0.8 Editor's Draft

**Specification Status:** [Draft](https://github.com/decentralized-identity/org/blob/master/work-item-lifecycle.md)

**Latest Draft:** [identity.foundation/did-traits](https://identity.foundation/did-traits)

**Ratified Versions:**

~ [identity.foundation/did-traits/v0.8.0](https://identity.foundation/did-traits/v0.8.0)

**Editors:**

~ [Jan Christoph Ebersbach](https://www.linkedin.com/in/JCEbersbach) (identinet)

**Authors:**

~ [Jan Christoph Ebersbach](https://www.linkedin.com/in/JCEbersbach) (identinet)
~ [Otto Mora](https://www.linkedin.com/in/otto-mora/) (Privado ID)


**Participate:**

~ [GitHub repo](https://github.com/decentralized-identity/did-traits)

~ [File a bug](https://github.com/decentralized-identity/did-traits/issues)

~ [Commit history](https://github.com/decentralized-identity/did-traits/commits/main)

Except where otherwise noted, this work by the [Decentralized Identity Foundation](https://identity.foundation/) is
licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0).

## Abstract

This document guides implementers of [W3C Decentralized Identifiers (DIDs)](https://w3c.github.io/did-core/) in
selecting suitable DID methods for their specific use cases by defining proven and relevant Decentralized Identifiers
traits. It includes a JSON schema for representing traits of a concrete DID method in a structured, machine-readable
format, enabling integration with third-party systems such as DID resolvers. This specification builds upon existing
literature and specifications detailed in the [References](#references) section.

## Status of This Document

This is a draft specification being developed within the
[Decentralized Identity Foundation](https://identity.foundation) (DIF). Design work is ongoing, and participants are
encouraged to open issues or otherwise contribute at
[the DIF-hosted github repository](https://github.com/decentralized-identity/did-traits), whether as input to stable
versions or as recommendations for future versions.

## Terminology

[[def:Decentralized Identifiers, Decentralized Identifier, DID]] ~ Unique ID URI string and PKI metadata document format
for describing the cryptographic keys and other fundamental PKI values linked to a unique, user-controlled,
self-sovereign identifier in a target system (i.e. blockchain, distributed ledger).

[[def:Traits, Trait]] ~ A distinct, measurable characteristic of a Decentralized Identifier method that influences its
behavior, capabilities, or implementation requirements.

## Structure of this Document

This specification is organized into three main sections:

1. [Definition of Traits](#definition-of-traits): Provides detailed definitions and descriptions of identified DID
   method traits. Each trait is explained in terms of its significance, characteristics, and impact on DID method
   implementation and usage.
2. [JSON Schema Data Model](#json-schema-data-model): Presents a formal schema for representing DID method traits in a
   machine-readable format. This section includes the complete JSON schema definition along with examples illustrating
   its application.
3. [Comparison of DID Methods](#comparison-of-did-methods): Contains a comprehensive table comparing different DID
   methods based on their traits. This comparison enables implementers to evaluate and select DID methods that best
   match their requirements.

The specification references supporting literature and related specifications throughout these sections, with complete
references provided at the end of the document.

## Definition of Traits

This section systematically defines the characteristics that distinguish and differentiate DID methods. While all DID
methods fundamentally support core operations for creating and retrieving DID documents, they exhibit diverse additional
traits that reflect their unique design. These traits have been identified through analysis of existing DID methods and
their real-world implementations. Each trait definition includes its name and description.

<!--
Generated with ../generate-markdown-table-traits.nu
-->

| Trait                                                                                                                                 | Definition                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a id="updateable" href="#comp-updateable">Updateable</a>                                                                             | DID Documents are updateable, see https://w3c.github.io/did-core/#method-operations.                                                                                                                                                                                                                                                                                                                                                               |
| <a id="updateableServiceEndpoints" href="#comp-updateableServiceEndpoints">Updateable Service Endpoints</a>                           | Service endpoints are updateable, see https://w3c.github.io/did-core/#services.                                                                                                                                                                                                                                                                                                                                                                    |
| <a id="deactivatable" href="#comp-deactivatable">Deactivatable</a>                                                                    | DIDs are deactivatable, see https://w3c.github.io/did-core/#method-operations.                                                                                                                                                                                                                                                                                                                                                                     |
| <a id="deletable" href="#comp-deletable">Deletable</a>                                                                                | DID method's capability to permanently remove a DID and its associated DID document from the underlying system, rendering the identifier and its historical irresolvable.                                                                                                                                                                                                                                                                          |
| <a id="transactionalFees" href="#comp-transactionalFees">Transactional Fees</a>                                                       | Indicates whether a DID method imposes mandatory transactional costs for creating, updating, or deactivating identifiers. These fees are typically associated with blockchain or distributed ledger-based methods, where computational resources and network consensus mechanisms necessitate economic compensation.                                                                                                                               |
| <a id="selfCertifying" href="#comp-selfCertifying">Self-Certifying</a>                                                                | DID method where the cryptographic material used to generate the DID is embedded within the identifier itself, creating an inherent and verifiable cryptographic binding between the DID, its initial DID document, and the associated cryptographic keys. This approach eliminates the need for external verification infrastructure, as the identifier's authenticity can be cryptographically validated through its own intrinsic key material. |
| <a id="updateableVerificationMethods" href="#comp-updateableVerificationMethods">Rotatable Verification Methods</a>                   | Verification methods are updateable, allowing cryptographic keys to be replaced or updated, see https://w3c.github.io/did-core/#verification-methods.                                                                                                                                                                                                                                                                                              |
| <a id="prerotationOfKeys" href="#comp-prerotationOfKeys">Pre-rotation of Keys</a>                                                     | Cryptographic mechanism that enables a DID controller to securely commit to a future key rotation without revealing the actual replacement public key. This technique creates a verifiable, one-way commitment to the next cryptographic key pair, preventing malicious actors who compromise the current private key from arbitrarily rotating to a new key of their choosing.                                                                    |
| <a id="multisigVerificationMethod" href="#comp-multisigVerificationMethod">Multi-Signature Verification Method</a>                    | A DID method that supports distributed control of a decentralized identifier through a cryptographic mechanism requiring multiple independent signatures to authorize critical identity operations such as updating, deactivating or using the DID.                                                                                                                                                                                                |
| <a id="humanreadable" href="#comp-humanreadable">Human-readable</a>                                                                   | A DID method's ability to generate identifiers that are cognitively accessible and memorable to humans, typically incorporating meaningful, domain-specific, or intuitive components.                                                                                                                                                                                                                                                              |
| <a id="enumerable" href="#comp-enumerable">Enumerable</a>                                                                             | A DID method where all identifiers within the system can be comprehensively discovered and listed through a publicly accessible registry, typically implemented using a distributed ledger technology (DLT) or similar transparent infrastructure.                                                                                                                                                                                                 |
| <a id="resolvableLocally" href="#comp-resolvableLocally">Locally Resolvable</a>                                                       | A DID method where identifiers and their associated DID documents are resolvable and verifiable only within a specific, transient local context.                                                                                                                                                                                                                                                                                                   |
| <a id="resolvableGlobally" href="#comp-resolvableGlobally">Globally Resolvable</a>                                                    | A DID method where identifiers can be resolved from any network location, enabling universal access to the associated DID document across diverse computational environments and geographic boundaries.                                                                                                                                                                                                                                            |
| <a id="history" href="#comp-history">DID Document History</a>                                                                         | A DID method's capability to preserve and retrieve previous versions of a DID document, enabling comprehensive historical traceability of identity metadata and modifications.                                                                                                                                                                                                                                                                     |
| <a id="historySigned" href="#comp-historySigned">Cryptograhpically signed DID Document History</a>                                    | A DID method's capability to record all modifications to the DID document in an append-only, cryptographically verifiable data structure that prevents retroactive alteration or deletion of historical states.                                                                                                                                                                                                                                    |
| <a id="hostingNotRequired" href="#comp-hostingNotRequired">Hosting not required</a>                                                   | DID document hosting on persistent storage is not required, at least for the initial DID document. For example: did:key and did:peer.                                                                                                                                                                                                                                                                                                              |
| <a id="hostedCentrally" href="#comp-hostedCentrally">Centrally Hosted</a>                                                             | DID document is stored and managed and resolved through a single, centralized service infrastructure, typically implemented using a web server or controlled repository.                                                                                                                                                                                                                                                                           |
| <a id="hostedDecentrally" href="#comp-hostedDecentrally">Decentrally Hosted</a>                                                       | DID document is stored, managed, and resolved through a distributed infrastructure, typically implemented using decentralized ledger technologies (DLT) or peer-to-peer networks.                                                                                                                                                                                                                                                                  |
| <a id="cryptographyPrivacyPreservingBBSPlus" href="#comp-cryptographyPrivacyPreservingBBSPlus">Privacy Preserving Crypto - BBS+</a>   | A DID method’s ability to use cryptographic techniques that enable identity verification and authentication while minimizing the disclosure of sensitive personal information. Specifically by using the Selective Disclosure techniques of the BBS+ scheme as standardized in the IETF CFRG https://datatracker.ietf.org/doc/draft-irtf-cfrg-bbs-signatures/.                                                                                     |
| <a id="cryptographyPrivacyPreservingNiZKPs" href="#comp-cryptographyPrivacyPreservingNiZKPs">Privacy Preserving Crypto - niZKPs</a>   | A DID method’s ability to use cryptographic techniques that enable identity verification and authentication while minimizing the disclosure of sensitive personal information. Using other cryptography that supports Non-interactive Zero Knowledge Proofs (niZKPs) such as zk-SNARKS, zk-STARKS, Bulletproofs or other similar zero knowledge protocol types.                                                                                    |
| <a id="cryptographicAlgorithmRsa2048" href="#comp-cryptographicAlgorithmRsa2048">RSA, 2048 bit key size</a>                           | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmRsa3072" href="#comp-cryptographicAlgorithmRsa3072">RSA, 3072 bit key size</a>                           | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmRSA4096" href="#comp-cryptographicAlgorithmRSA4096">RSA, 4096 bit key size</a>                           | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmECDSAsec256k1" href="#comp-cryptographicAlgorithmECDSAsec256k1">ECDSA, curve sec256k1</a>                | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmECDSAsecp384r1" href="#comp-cryptographicAlgorithmECDSAsecp384r1">ECDSA, curve secp384r1</a>             | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmECDSAsecp512r1" href="#comp-cryptographicAlgorithmECDSAsecp512r1">ECDSA, curve secp512r1</a>             | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmEdDSA25519" href="#comp-cryptographicAlgorithmEdDSA25519">EdDSA, curve ed25519</a>                       | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmEdDSAed25519" href="#comp-cryptographicAlgorithmEdDSAed25519">EdDSA, curve ed448</a>                     | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmBrainpoolP256r1" href="#comp-cryptographicAlgorithmBrainpoolP256r1">Brainpool, curve BrainpoolP256r1</a> | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmBrainpoolP384r1" href="#comp-cryptographicAlgorithmBrainpoolP384r1">Brainpool, curve BrainpoolP384r1</a> | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmBrainpoolP512r1" href="#comp-cryptographicAlgorithmBrainpoolP512r1">Brainpool, curve BrainpoolP512r1</a> | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmGOST256" href="#comp-cryptographicAlgorithmGOST256">GOST, curve GOST-256</a>                             | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmGOST512" href="#comp-cryptographicAlgorithmGOST512">GOST, curve GOST-512</a>                             | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |
| <a id="cryptographicAlgorithmSM2" href="#comp-cryptographicAlgorithmSM2">SM, curve SM2</a>                                            | A DID method supports the cryptographic algorithm, which has been verified by any of the government entities mentioned in appendix National Cryptographic Standards Bodies.                                                                                                                                                                                                                                                                        |

## JSON Schema Data Model

The specification defines a normative JSON Schema data model for documenting and representing DID method traits in a
machine-readable format. The canonical schema is formally defined at
<https://identity.foundation/did-traits/schemas/traits.json>.

DID method authors SHALL use this schema to describe their method's trait support. The schema is structured with two
primary components:

- A `name` property of type string identifying the specific DID method.
- Traits properties of type boolean.

All traits are represented as boolean values with the following semantics:

- `true` indicates explicit support for the corresponding trait
- `false` explicitly indicates non-support of the trait.
- Omission of a trait property is equivalent to `false`.

Conforming implementations MUST validate their trait documentation against this JSON Schema, ensuring consistent and
unambiguous representation of DID method capabilities.

### Example

This example demonstrates a complete JSON representation of the did:web DID method, illustrating the schema's structure.

<!--
See ../examples/web.json
-->

```json
{
  "$schema": "https://identity.foundation/did-traits/schemas/traits.json",
  "name": "web",
  "updateable": true,
  "updateableServiceEndpoints": true,
  "deactivatable": true,
  "deletable": true,
  "transactionalFees": false,
  "selfCertifying": false,
  "updateableVerificationMethods": true,
  "prerotationOfKeys": false,
  "multisigVerificationMethod": false,
  "humanreadable": true,
  "enumerable": false,
  "resolvableLocally": false,
  "resolvableGlobally": true,
  "history": false,
  "historySigned": false,
  "hostingNotRequired": false,
  "hostedCentrally": true,
  "hostedDecentrally": false,
  "cryptographyPrivacyPreservingBBSPlus": true,
  "cryptographyPrivacyPreservingNiZKPs": true,
  "cryptographicAlgorithmRsa2048": true,
  "cryptographicAlgorithmRsa3072": true,
  "cryptographicAlgorithmRSA4096": true,
  "cryptographicAlgorithmECDSAsec256k1": true,
  "cryptographicAlgorithmECDSAsecp384r1": true,
  "cryptographicAlgorithmECDSAsecp512r1": true,
  "cryptographicAlgorithmEdDSA25519": true,
  "cryptographicAlgorithmEdDSAed25519": true,
  "cryptographicAlgorithmBrainpoolP256r1": true,
  "cryptographicAlgorithmBrainpoolP384r1": true,
  "cryptographicAlgorithmBrainpoolP512r1": true,
  "cryptographicAlgorithmGOST256": true,
  "cryptographicAlgorithmGOST512": true,
  "cryptographicAlgorithmSM2": true
}
```

## Comparison of DID Methods

The following table illustrates trait support across a sample of DID methods, demonstrating how traits can be used to
analyze and compare method capabilities. While not exhaustive, this comparison highlights key differences in method
implementations and their supported features.

<!--
Generated via ../generate-markdown-table-comparison.nu
-->

| Trait                                                                                                                                 | [did:cheqd](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:iden3](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:key](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:peer](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:web](https://www.w3.org/TR/did-extensions-methods/#did-methods) | [did:webvh](https://www.w3.org/TR/did-extensions-methods/#did-methods) |
| ------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| <a id="comp-updateable" href="#updateable">Updateable</a>                                                                             | ✅                                                                     | ✅                                                                     |                                                                      | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-updateableServiceEndpoints" href="#updateableServiceEndpoints">Updateable Service Endpoints</a>                           | ✅                                                                     | ✅                                                                     |                                                                      | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-deactivatable" href="#deactivatable">Deactivatable</a>                                                                    | ✅                                                                     | ✅                                                                     |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| <a id="comp-deletable" href="#deletable">Deletable</a>                                                                                |                                                                        |                                                                        |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| <a id="comp-transactionalFees" href="#transactionalFees">Transactional Fees</a>                                                       | ✅                                                                     | ✅                                                                     |                                                                      |                                                                       |                                                                      |                                                                        |
| <a id="comp-selfCertifying" href="#selfCertifying">Self-Certifying</a>                                                                |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    |                                                                      | ✅                                                                     |
| <a id="comp-updateableVerificationMethods" href="#updateableVerificationMethods">Rotatable Verification Methods</a>                   | ✅                                                                     | ✅                                                                     |                                                                      | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-prerotationOfKeys" href="#prerotationOfKeys">Pre-rotation of Keys</a>                                                     |                                                                        |                                                                        |                                                                      |                                                                       |                                                                      | ✅                                                                     |
| <a id="comp-multisigVerificationMethod" href="#multisigVerificationMethod">Multi-Signature Verification Method</a>                    | ✅                                                                     |                                                                        |                                                                      |                                                                       |                                                                      |                                                                        |
| <a id="comp-humanreadable" href="#humanreadable">Human-readable</a>                                                                   |                                                                        |                                                                        |                                                                      |                                                                       | ✅                                                                   |                                                                        |
| <a id="comp-enumerable" href="#enumerable">Enumerable</a>                                                                             | ✅                                                                     |                                                                        |                                                                      |                                                                       |                                                                      |                                                                        |
| <a id="comp-resolvableLocally" href="#resolvableLocally">Locally Resolvable</a>                                                       |                                                                        |                                                                        |                                                                      | ✅                                                                    |                                                                      |                                                                        |
| <a id="comp-resolvableGlobally" href="#resolvableGlobally">Globally Resolvable</a>                                                    | ✅                                                                     | ✅                                                                     | ✅                                                                   |                                                                       | ✅                                                                   | ✅                                                                     |
| <a id="comp-history" href="#history">DID Document History</a>                                                                         | ✅                                                                     | ✅                                                                     |                                                                      |                                                                       |                                                                      | ✅                                                                     |
| <a id="comp-historySigned" href="#historySigned">Cryptograhpically signed DID Document History</a>                                    | ✅                                                                     | ✅                                                                     |                                                                      |                                                                       |                                                                      | ✅                                                                     |
| <a id="comp-hostingNotRequired" href="#hostingNotRequired">Hosting not required</a>                                                   |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    |                                                                      | ✅                                                                     |
| <a id="comp-hostedCentrally" href="#hostedCentrally">Centrally Hosted</a>                                                             |                                                                        |                                                                        |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| <a id="comp-hostedDecentrally" href="#hostedDecentrally">Decentrally Hosted</a>                                                       | ✅                                                                     | ✅                                                                     |                                                                      |                                                                       |                                                                      |                                                                        |
| <a id="comp-cryptographyPrivacyPreservingBBSPlus" href="#cryptographyPrivacyPreservingBBSPlus">Privacy Preserving Crypto - BBS+</a>   |                                                                        |                                                                        |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographyPrivacyPreservingNiZKPs" href="#cryptographyPrivacyPreservingNiZKPs">Privacy Preserving Crypto - niZKPs</a>   |                                                                        | ✅                                                                     |                                                                      |                                                                       | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmRsa2048" href="#cryptographicAlgorithmRsa2048">RSA, 2048 bit key size</a>                           |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmRsa3072" href="#cryptographicAlgorithmRsa3072">RSA, 3072 bit key size</a>                           |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmRSA4096" href="#cryptographicAlgorithmRSA4096">RSA, 4096 bit key size</a>                           |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmECDSAsec256k1" href="#cryptographicAlgorithmECDSAsec256k1">ECDSA, curve sec256k1</a>                |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmECDSAsecp384r1" href="#cryptographicAlgorithmECDSAsecp384r1">ECDSA, curve secp384r1</a>             |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmECDSAsecp512r1" href="#cryptographicAlgorithmECDSAsecp512r1">ECDSA, curve secp512r1</a>             |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmEdDSA25519" href="#cryptographicAlgorithmEdDSA25519">EdDSA, curve ed25519</a>                       | ✅                                                                     |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmEdDSAed25519" href="#cryptographicAlgorithmEdDSAed25519">EdDSA, curve ed448</a>                     |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmBrainpoolP256r1" href="#cryptographicAlgorithmBrainpoolP256r1">Brainpool, curve BrainpoolP256r1</a> |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmBrainpoolP384r1" href="#cryptographicAlgorithmBrainpoolP384r1">Brainpool, curve BrainpoolP384r1</a> |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmBrainpoolP512r1" href="#cryptographicAlgorithmBrainpoolP512r1">Brainpool, curve BrainpoolP512r1</a> |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmGOST256" href="#cryptographicAlgorithmGOST256">GOST, curve GOST-256</a>                             |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmGOST512" href="#cryptographicAlgorithmGOST512">GOST, curve GOST-512</a>                             |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |
| <a id="comp-cryptographicAlgorithmSM2" href="#cryptographicAlgorithmSM2">SM, curve SM2</a>                                            |                                                                        |                                                                        | ✅                                                                   | ✅                                                                    | ✅                                                                   | ✅                                                                     |

## Appendix

### National Cryptographic Standards Bodies

List of national cryptographic standards bodies that approve cryptographic alogorithms for national use:

| Country              | Agency Name                                                                                              | Website                                                                                  |
| -------------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Australia            | Australian Signals Directorate (ASD)                                                                     | <https://www.asd.gov.au/>                                                                |
| Brazil               | Instituto Nacional de Tecnologia da Informação (ITI)                                                     | <https://www.gov.br/iti/pt-br>                                                           |
| Canada               | Communications Security Establishment Canada (CSE)                                                       | <https://www.cse-cst.gc.ca>                                                              |
| China                | State Cryptography Administration (SCA)                                                                  | <http://www.sca.gov.cn>                                                                  |
| European Union       | European Union Agency for Cybersecurity (ENISA) & European Telecommunications Standards Institute (ETSI) | <https://www.enisa.europa.eu> & <https://www.etsi.org>                                   |
| Israel               | National Cyber Directorate                                                                               | <https://www.gov.il/en/departments/israel_national_cyber_directorate/govil-landing-page> |
| Japan                | Cryptography Research and Evaluation Committees (CRYPTREC)                                               | <https://www.cryptrec.go.jp>                                                             |
| Russia               | EASC - Euro-Asian Council for standardization, metrology and certification                               | <https://easc.by/>                                                                       |
| South Korea          | Korea Cryptographic Module Validation Program (KCMVP) & National Intelligence Service (NIS)              | <https://eng.nis.go.kr/EAF/1_7_2_1.do>                                                   |
| United Arab Emirates | Telecommunications and Digital Government Regulatory Authority (TDRA)                                    | <https://www.tdra.gov.ae>                                                                |
| United States        | National Institute of Standards and Technology (NIST)                                                    | <https://www.nist.gov>                                                                   |

### Related Specifications and Research

- [A Taxonomy of Decentralized Identifier Methods for Practitioners](https://arxiv.org/pdf/2311.03367). F. Hoops, A.
  Mühle, F. Matthes, C. Meinel. 2023.
- [DID Method Enumeration Proposal](https://hackmd.io/qz2Mbx7_RuOVLf9YQnz_rA?view). S. Curren. 2024.
- [DID Method Rubric](https://www.w3.org/TR/did-rubric/). J. Andrieu, R. Grant, D. Hardman. 2021.
- [DID Method Traits](https://openwallet-foundation.github.io/digital-wallet-and-agent-overviews-sig/#/resources/Key%20Management).
  OpenWallet Foundation. 2024.
- [DID Utility Comparison](https://docs.google.com/spreadsheets/d/18MpvpFPLjL2I7RSFI44heWrrvf3l9pAArzhznAPFVAQ/edit?gid=0#gid=0).
  Trust over IP Foundation. 2024.
- [DID:X Continued: The Perfect DID Method?](https://decentralgabe.xyz/did-x-continued-the-perfect-did-method/). G.
  Cohen. 2023.
- [Methods for Decentralized Identities: Evaluation and Insights](https://eprint.iacr.org/2021/1087.pdf). W. Fdhila, N.
  Stifter, K. Kostal, C. Saglam, M. Sabadello. 2021.
- [Ugradeable Decentralized Identity - DID Method Traits](https://blog.spruceid.com/upgradeable-decentralized-identity/).
  W. Chang. 2023.

## References

### Informative References

[[def:JSON Schema]]
~ [JSON Schema: A Media Type for Describing JSON Documents](https://json-schema.org/draft/2020-12/json-schema-core.html).
  A. Wright, H. Andrews, B. Hutton, G. Dennis. Status: 28 January 2020. Status: Internet-Draft.

## Patent Policy

The Decentralized Identity Foundation has adopted the W3C Patent Policy (2004), as detailed below:

- **Licensing Commitment.** Each contributor agrees to make available any of its Essential Claims, as defined in the W3C
  Patent Policy (available at http://www.w3.org/Consortium/Patent-Policy-20040205), under the W3C RF licensing
  requirements Section 5 (http://www.w3.org/Consortium/Patent-Policy-20040205), as if the contribution was contained in
  or associated with a W3C Recommendation.

- **For Exclusion.** Prior to committing any code, bug reports, pull requests, or other forms of contribution, a
  contributor may exclude Essential Claims from its licensing commitments under this agreement by providing written
  notice of that intent to DIF's Executive Director (and must received confirmation of receipt for the exclusion to have
  effect). The Exclusion Notice for issued patents and published applications must include the patent number(s) or title
  and application number(s), as the case may be, for each of the issued patent(s) or pending patent application(s) that
  the contributor wishes to exclude from the licensing commitment set forth in Section 1 of this patent policy. If an
  issued patent or pending patent application that may contain Essential Claims is not set forth in the Exclusion
  Notice, those Essential Claims shall continue to be subject to the licensing commitments under this agreement. The
  Exclusion Notice for unpublished patent applications must provide either: (i) the text of the filed application; or
  (ii) identification of the specific part(s) of the contribution whose implementation makes the excluded claim an
  Essential Claim. If (ii) is chosen, the effect of the exclusion will be limited to the identified part(s) of the
  contribution. DIF's Executive Director will publish Exclusion Notices.

## Acknowledgements

We thank the Decentralized Identity Foundation and the Identity and Discovery working group for their support in this
specification.
