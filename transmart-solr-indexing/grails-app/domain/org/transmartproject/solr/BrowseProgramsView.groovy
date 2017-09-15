package org.transmartproject.solr

import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode
class BrowseProgramsView implements Serializable {

    String id
    String title
    String description
    String disease
    String observation
    String pathway
    String gene
    String therapeuticDomain
    String institution
    String target

    static mapping = {
        table schema: 'biomart_user'
        version false

        id         insert: false, update: false
    }

    static constraints = {
        id nullable: true, maxSize: 300
        title nullable: true, maxSize: 1000
        description nullable: true, maxSize: 2000
        disease nullable: true
        observation nullable: true
        pathway nullable: true
        gene nullable: true
        therapeuticDomain nullable: true
        institution nullable: true
        target nullable: true
    }

    def getIdentifier() {
        id
    }

}
