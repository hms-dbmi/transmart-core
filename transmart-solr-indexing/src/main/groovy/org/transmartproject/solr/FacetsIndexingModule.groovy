package org.transmartproject.solr

interface FacetsIndexingModule {

    String getName()

    Set<String> getSupportedDocumentTypes()

    Iterator<FacetsDocId> fetchAllIds(String type)

    Set<FacetsDocument> collectDocumentsWithIds(Set<FacetsDocId> docIds)

    FacetsFieldDisplaySettings getDisplaySettingsForIndex(String fieldName /* solr schema field name */)
}
