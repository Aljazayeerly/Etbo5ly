package com.iti.jet.gp.etbo5ly.model.pojos;


// Generated May 1, 2016 3:52:52 PM by Hibernate Tools 4.0.0

/**
 * Document generated by hbm2java
 */
public class Document implements java.io.Serializable {

	private int documentId;
	private DocumentType documentType;
	private Cook cook;
	private String description;
	private Byte verfied;
	private byte[] document;

	public Document() {
	}

	public Document(int documentId, DocumentType documentType, Cook cook) {
		this.documentId = documentId;
		this.documentType = documentType;
		this.cook = cook;
	}

	public Document(int documentId, DocumentType documentType, Cook cook,
			String description, Byte verfied, byte[] document) {
		this.documentId = documentId;
		this.documentType = documentType;
		this.cook = cook;
		this.description = description;
		this.verfied = verfied;
		this.document = document;
	}

	public int getDocumentId() {
		return this.documentId;
	}

	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}

	public DocumentType getDocumentType() {
		return this.documentType;
	}

	public void setDocumentType(DocumentType documentType) {
		this.documentType = documentType;
	}

	public Cook getCook() {
		return this.cook;
	}

	public void setCook(Cook cook) {
		this.cook = cook;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Byte getVerfied() {
		return this.verfied;
	}

	public void setVerfied(Byte verfied) {
		this.verfied = verfied;
	}

	public byte[] getDocument() {
		return this.document;
	}

	public void setDocument(byte[] document) {
		this.document = document;
	}

}
