# did-traits 0.1 Editor's Draft

**Specification Status:** [Pre-Draft](https://github.com/decentralized-identity/org/blob/master/work-item-lifecycle.md)

**Latest Draft:** [identity.foundation/did-traits](https://identity.foundation/did-traits)

**Ratified Versions:**

**Editors:**

~ [Jan Christoph Ebersbach](https://www.linkedin.com/in/JCEbersbach) (identinet)

<!-- -->

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

[[def:Decentralized Identifiers, Decentralized Identifier, DID]]

~ Unique ID URI string and PKI metadata document format for describing the cryptographic keys and other fundamental PKI
values linked to a unique, user-controlled, self-sovereign identifier in a target system (i.e. blockchain, distributed
ledger).

[[def:Traits, Trait]]

~ A distinct, measurable characteristic of a Decentralized Identifier method that influences its behavior, capabilities,
or implementation requirements.

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

Table generated from JSON Schema: https://identity.foundation/did-traits/schemas/traits.json

Contribute here: https://github.com/decentralized-identity/did-traits/blob/main/schemas/traits.json

<!--
Generated with ../generate-markdown-table.nu
-->

| Trait                                                                         | Definition                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a id="updateable">Updateable</a>                                             | DID Documents are updateable, see https://w3c.github.io/did-core/#method-operations.                                                                                                                                                                                                                                                                                                                                                               |
| <a id="updateable_service_endpoints">Updateable Service Endpoints</a>         | Service endpoints are updateable, see https://w3c.github.io/did-core/#services.                                                                                                                                                                                                                                                                                                                                                                    |
| <a id="deactivatable">Deactivatable</a>                                       | DIDs are deactivatable, see https://w3c.github.io/did-core/#method-operations.                                                                                                                                                                                                                                                                                                                                                                     |
| <a id="deletable">Deletable</a>                                               | DID method's capability to permanently remove a DID and its associated DID document from the underlying system, rendering the identifier and its historical irresolvable.                                                                                                                                                                                                                                                                          |
| <a id="explicit_fees">Explicit Fees</a>                                       | Indicates whether a DID method imposes mandatory transactional costs for creating, updating, or deactivating identifiers. These fees are typically associated with blockchain or distributed ledger-based methods, where computational resources and network consensus mechanisms necessitate economic compensation.                                                                                                                               |
| <a id="self-certifying">Self-Certifying</a>                                   | DID method where the cryptographic material used to generate the DID is embedded within the identifier itself, creating an inherent and verifiable cryptographic binding between the DID, its initial DID document, and the associated cryptographic keys. This approach eliminates the need for external verification infrastructure, as the identifier's authenticity can be cryptographically validated through its own intrinsic key material. |
| <a id="updateable_verification_methods">Rotatable Verification Methods</a>    | Verification methods are updateable, allowing cryptographic keys to be replaced or updated, see https://w3c.github.io/did-core/#verification-methods.                                                                                                                                                                                                                                                                                              |
| <a id="pre-rotation_of_keys">Pre-rotation of Keys</a>                         | Cryptographic mechanism that enables a DID controller to securely commit to a future key rotation without revealing the actual replacement public key. This technique creates a verifiable, one-way commitment to the next cryptographic key pair, preventing malicious actors who compromise the current private key from arbitrarily rotating to a new key of their choosing.                                                                    |
| <a id="multi-sig_verification_method">Multi-Signature Verification Method</a> | A DID method that supports distributed control of a decentralized identifier through a cryptographic mechanism requiring multiple independent signatures to authorize critical identity operations such as updating, deactivating or using the DID.                                                                                                                                                                                                |
| <a id="human-readable">Human-readable</a>                                     | A DID method's ability to generate identifiers that are cognitively accessible and memorable to humans, typically incorporating meaningful, domain-specific, or intuitive components.                                                                                                                                                                                                                                                              |
| <a id="enumerable">Enumerable</a>                                             | A DID method where all identifiers within the system can be comprehensively discovered and listed through a publicly accessible registry, typically implemented using a distributed ledger technology (DLT) or similar transparent infrastructure.                                                                                                                                                                                                 |
| <a id="resolvable_locally">Locally Resolvable</a>                             | A DID method where identifiers and their associated DID documents are resolvable and verifiable only within a specific, transient local context.                                                                                                                                                                                                                                                                                                   |
| <a id="resolvable_globally">Globally Resolvable</a>                           | A DID method where identifiers can be resolved from any network location, enabling universal access to the associated DID document across diverse computational environments and geographic boundaries.                                                                                                                                                                                                                                            |
| <a id="history">DID Document History</a>                                      | A DID method's capability to preserve and retrieve previous versions of a DID document, enabling comprehensive historical traceability of identity metadata and modifications.                                                                                                                                                                                                                                                                     |
| <a id="history_signed">Cryptograhpically signed DID Document History</a>      | A DID method's capability to record all modifications to the DID document in an append-only, cryptographically verifiable data structure that prevents retroactive alteration or deletion of historical states.                                                                                                                                                                                                                                    |
| <a id="hosted_not">Not Hosted</a>                                             | dID document is generated and verified entirely through cryptographic mechanisms, without requiring persistent storage or external hosting infrastructure.                                                                                                                                                                                                                                                                                         |
| <a id="hosted_centrally">Centrally Hosted</a>                                 | The DID document is stored and managed through a single, centralized service infrastructure, typically implemented using a web server or controlled repository.                                                                                                                                                                                                                                                                                    |
| <a id="hosted_decentrally">Decentrally Hosted</a>                             | The DID document is stored, managed, and resolved through a distributed infrastructure, typically implemented using decentralized ledger technologies (DLT) or peer-to-peer networks.                                                                                                                                                                                                                                                              |
| <a id="cryptography_privacy_preserving">Privacy Preserving Cryptography</a>   | A DID method's ability to use cryptographic techniques that enable identity verification and authentication while minimizing the disclosure of sensitive personal information. Example: BBS.                                                                                                                                                                                                                                                       |
| <a id="cryptography_government-approved">Government-approved Cryptography</a> | A DID method that implements cryptographic algorithms and protocols explicitly validated and recommended by national cryptographic standards bodies. Example: FIPS 186-4.                                                                                                                                                                                                                                                                          |
| <a id="gdpr-compliant">GDPR-compliant</a>                                     | A DID method's ability to fully adhere to the European Union's General Data Protection Regulation (GDPR) requirements, ensuring comprehensive protection of personal data and individual privacy rights.                                                                                                                                                                                                                                           |

## JSON Schema Data Model

TODO

## Comparison of DID Methods

INFO: this table is not a deliverable of this work item. It's merely an example of how a comparison table could look
like.

| Method \ Trait                                                                | [Deactivatable](#deactivatable) | [Enumerable](#enumerable) | [Globally resolvable](#globally) | [History available](#history) | [Immutable History](#immutable) | [Human-readable](#human-readable) | [Key Pre-Rotation](#pre-rotation) | [Modifiable](#modifiable) | [Self-Certification](#self-certification) | [Self-Creation](#self-creation) | [Explicit fees](#fees) |
| ----------------------------------------------------------------------------- | ------------------------------- | ------------------------- | -------------------------------- | ----------------------------- | ------------------------------- | --------------------------------- | --------------------------------- | ------------------------- | ----------------------------------------- | ------------------------------- | ---------------------- |
| [did:tdw](https://bcgov.github.io/trustdidweb/)                               | [`x`](#x)                       |                           | [`x`](#x)                        | [`x`](#x)                     | [`x`](#x)                       |                                   | [`x`](#x)                         | [`x`](#x)                 | [`x`](#x)                                 |                                 |                        |
| [did:web](https://w3c-ccg.github.io/did-method-web/)                          | [`x`](#x)                       |                           | [`x`](#x)                        |                               |                                 | [`x`](#x)                         |                                   | [`x`](#x)                 |                                           |                                 |                        |
| did:key                                                                       |                                 |                           | [`x`](#x)                        |                               |                                 |                                   |                                   |                           | [`x`](#x)                                 | [`x`](#x)                       |                        |
| did:jwk                                                                       |                                 |                           | [`x`](#x)                        |                               |                                 |                                   |                                   |                           | [`x`](#x)                                 | [`x`](#x)                       |                        |
| did:peer                                                                      |                                 |                           |                                  | [`x`](#x)                     |                                 |                                   |                                   | [`x`](#x)                 | [`x`](#x)                                 | [`x`](#x)                       |                        |
| did:dht                                                                       | [`x`](#x)                       | [`x`](#x)                 | [`x`](#x)                        | [`x`](#x)                     | [`?`](#?)                       |                                   | [`?`](#?)                         | [`x`](#x)                 | [`?`](#?)                                 | [`?`](#?)                       |                        |
| [did:webs](https://trustoverip.github.io/tswg-did-method-webs-specification/) |                                 |                           |                                  |                               |                                 |                                   |                                   |                           |                                           |                                 |                        |
| did:indy                                                                      |                                 |                           |                                  |                               |                                 |                                   |                                   |                           |                                           |                                 |                        |
| did:ebsi                                                                      |                                 |                           |                                  |                               |                                 |                                   |                                   |                           |                                           |                                 |                        |
| did:cheqd                                                                     |                                 |                           |                                  |                               |                                 |                                   |                                   |                           |                                           |                                 |                        |
| [did:iden3](https://github.com/iden3/did-iden3/tree/main)                     |                                 |                           |                                  |                               |                                 |                                   |                                   |                           |                                           |                                 |                        |

## Appendix

### Relate Specifications and Research

- [DID Method Rubric](https://www.w3.org/TR/did-rubric/): A core inspiration for this work. The focus is wider, e.g.
  covering privacy, resource consumption and adoption, and less focused on concrete tangible feature differences.
  - [Methods for Decentralized Identities: Evaluation and Insights](https://eprint.iacr.org/2021/1087.pdf): Application
    of the DID Method Rubric to selected DID methods. See page 15 for the resulting comparison matrix.
- [A Taxonomy of Decentralized Identifier Methods for Practitioners](https://arxiv.org/pdf/2311.03367): Another core
  inspiration. The paper puts forward a comparison matrix with lots of sub-traits per category. Important newer traits
  are missing.
- [SpruceID Ugradeable Decentralized Identity - DID Method Traits](https://blog.spruceid.com/upgradeable-decentralized-identity/):
  Proposal from 2022 to produce a list of DID Method Traits. The list wasn't create, however a number of traits are
  proposed in the blog post.
- [OWF](https://openwallet-foundation.github.io/credential-format-comparison-sig/#/resources/Key%20Management)
- [DID Enumeration](https://hackmd.io/qz2Mbx7_RuOVLf9YQnz_rA?view)
- [ToIP DID Utility Comparison](https://docs.google.com/spreadsheets/d/18MpvpFPLjL2I7RSFI44heWrrvf3l9pAArzhznAPFVAQ/edit?gid=0#gid=0)
- [DID:X Continued: The Perfect DID Method?](https://decentralgabe.xyz/did-x-continued-the-perfect-did-method/)

## References

### Normative References

[[spec]]

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
