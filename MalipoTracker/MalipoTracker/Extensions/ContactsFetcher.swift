//
//  ContactsFetcher.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/08/2021.
//

import Foundation
import Contacts

class PhoneContacts {
    
    class private func getContacts(filter: ContactsFilter = .none) -> [CNContact] {
        
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactThumbnailImageDataKey] as [Any]
        
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        
        var results: [CNContact] = []
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            } catch {
                print("Error fetching containers")
            }
        }
        return results
    }
    
    class func getAllContacts() -> [Contact] {
        var resultingContacts: [Contact] = []
        let contacts = PhoneContacts.getContacts()
        
        for contact in contacts {
            if contact.phoneNumbers.count > 0  {
                let contactPhoneNumbers = contact.phoneNumbers
                let numbers = contactPhoneNumbers.compactMap { $0.value.value(forKey: "digits") as? String }
                let newContact = Contact(givenName: contact.givenName,
                                         lastName: contact.familyName,
                                         phoneNumbers: numbers)
                resultingContacts.append(newContact)
            }
        }
        return resultingContacts
    }
}
