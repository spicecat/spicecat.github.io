---
title: "LDAP Hell"
date: 2021-08-02T21:11:31-05:00
draft: true
type: "post"
---


*Originally posted on the [exozyme blog](https://git.exozy.me/exozyme/blog/src/branch/main/ldap-hell/index.html)*


<!DOCTYPE html>
<html>
    <head>
        <title>LDAP Hell</title>
        <link href="/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div>
            <br>
            <h2>LDAP Hell</h2>
            2021 August 2
            <br>
            <a href="/blog">The exozyme blog</a>
            <br>
            <br>
            
            <p>
                As exozyme enters beta, we've switched over from Keycloak to <a href="https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol">LDAP</a> for user management. The issue was Keycloak's excessive use of 600MB of RAM and a <i>ridiculous</i> 150 processes. All of that just for an authentication server! Even more problematic, getting OpenID Connect to work with all the web services required quite a lot of hacks, such as recompiling Mastodon with OIDC support. Yeah, that doesn't look to fun to maintain. Furthermore, it prevents us from getting to our one account to rule them all goal. At the minimum, you need one local Linux account and one Keycloak account. Of course you can use LDAP to sync these two... but why use Keycloak then?
            </p>
            <br>
            <p>
                Alright, so Keycloak has got to go. Time to research LDAP with the legendary ArchWiki! Unfortunately, the ArchWiki's guide for <a href="https://wiki.archlinux.org/title/LDAP_authentication">LDAP</a> is pretty outdated and lacking in details. Even worse, LDAP uses a whole jumble of weird terminology like BaseDN, cn, ou, and more.
            </p>
            <br>
            <p>
                The problem is that LDAP isn't something that's that difficult to understand. It's just that the docs are terrible.
            </p>
            <br>
            <p>
                LDAP is not something that normal users are going to bother with. It's almost entirely in the realm of enterprise stuff, a bridge into the world of 389, Active Directory, Kerberos, IPA, and more terms that I know absolutely nothing about. There are a few guides out there, but due to a relatively recent change in the way the OpenLDAP server is configured renders even three-year-old guides obsolete. It's terrible.
            </p>
            <br>
            <p>
                Still, I persisted, trudging through the scarce documentation for adding users and groups to LDAP and the nonexistent documentation for StartTLS with a Let's Encrypt certificate. At one point, I was stuck for several hours until I realized that I edited <i>/etc/pam.d/systemd-auth</i> instead of <i>/etc/pam.d/system-auth</i>. What an impossible error to catch...
            </p>
            <br>
            <p>
                Three days later, I <i>finally</i> got it all figured out. OpenLDAP only uses 8MB of RAM and you can finally log on to all exozyme core services with one account. Perfect! Now I want those three days back...
            </p>
            <br>
        </div>
    </body>
</html>
