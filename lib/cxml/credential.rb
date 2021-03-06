# frozen_string_literal: true

# This element contains identification and authentication values.
# Credential contains an Identity element and optionally a SharedSecret or a CredentialMac
# element. The Identity element states who the Credential represents, while the optional
# authentication elements verify the identity of the party
#
# Credential has the following attributes:
#
# *domain*
# Specifies the type of credential. This attribute allows
# documents to contain multiple types of credentials for multiple
# authentication domains.
# For messages sent on the Ariba Supplier Network, for
# instance, the domain can be AribaNetworkUserId to indicate an
# email address, DUNS for a D-U-N-S number, or NetworkId for a
# preassigned ID.
#
# *type* - optional
# Requests to or from a marketplace identify both the
# marketplace and the member company in From or To Credential
# elements. In this case, the credential for the marketplace uses
# the type attribute, which is set to the value “marketplace”
#
# *SharedSecred*
# The SharedSecret element is used when the Sender has a password that the requester recognizes.
#
# *CredentialMac*
# The CredentialMac element is used for the Message Authentication Code (MAC)
# authentication method. This authentication method is used in situations where the
# sender must prove to the receiver that it has been authenticated by shared secret by a
# trusted third party. For example, a direct PunchOut request can travel directly from a
# buyer to a supplier without going through a network commerce hub, because it
# contains a MAC (generated by the network commerce hub) that allows the supplier to
# authenticate it.

module CXML
  class Credential < DocumentNode
    accessible_attributes %i[
      domain
      type
    ]
    accessible_nodes %i[
      identity
      shared_secret
      credential_mac
    ]
  end
end
