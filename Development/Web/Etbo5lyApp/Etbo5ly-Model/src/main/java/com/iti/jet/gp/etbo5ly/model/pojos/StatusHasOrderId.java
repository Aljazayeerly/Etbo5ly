package com.iti.jet.gp.etbo5ly.model.pojos;

// Generated May 1, 2016 3:52:52 PM by Hibernate Tools 4.0.0

/**
 * StatusHasOrderId generated by hbm2java
 */
public class StatusHasOrderId implements java.io.Serializable {

	private int statusStatusId;
	private int orderOrderId;

	public StatusHasOrderId() {
	}

	public StatusHasOrderId(int statusStatusId, int orderOrderId) {
		this.statusStatusId = statusStatusId;
		this.orderOrderId = orderOrderId;
	}

	public int getStatusStatusId() {
		return this.statusStatusId;
	}

	public void setStatusStatusId(int statusStatusId) {
		this.statusStatusId = statusStatusId;
	}

	public int getOrderOrderId() {
		return this.orderOrderId;
	}

	public void setOrderOrderId(int orderOrderId) {
		this.orderOrderId = orderOrderId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof StatusHasOrderId))
			return false;
		StatusHasOrderId castOther = (StatusHasOrderId) other;

		return (this.getStatusStatusId() == castOther.getStatusStatusId())
				&& (this.getOrderOrderId() == castOther.getOrderOrderId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getStatusStatusId();
		result = 37 * result + this.getOrderOrderId();
		return result;
	}

}
