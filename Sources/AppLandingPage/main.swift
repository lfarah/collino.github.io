import Foundation
import Publish
import Plot

typealias Link = (name: String, url: String)
typealias AppStoreLink = String

// This type acts as the configuration for your website.
struct AppLandingPage: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case index
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://lucasfarah.dev/collinoapp.github.io/")!
    var name = "Collino"
    var description = "Make game nights perfect with Collino! Manage your collection, scan games to learn quickly, and keep everything organized for seamless fun."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

extension Website {
    var appStoreLink: AppStoreLink? {
        "https://apps.apple.com/us/app/collino/id6739600352"
    }
    
    var testflightLink: AppStoreLink? {
        nil
    }
    
    var plausibleSiteName: String? {
        "Collino"
    }

    var credits: Link {
        ("Lucas Farah", "https://lucasfarah.dev")
    }
    
    var footerLinks: [Link] {
        [(name: "Home", url: "/"),
        (name: "Support", url: "mailto:feedback@lucasfarah.dev"),
        (name: "About", url: "/about")]
    }
}

// This will generate your website using the built-in Foundation theme:
try AppLandingPage().publish(withTheme: .landingpage,
                             additionalSteps: [
                                 .deploy(using: .gitHub("lfarah/collinoapp.github.io", useSSH: false))
                             ]
)

