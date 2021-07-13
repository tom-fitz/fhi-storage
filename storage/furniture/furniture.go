package furniture

import (
	"time"

	"github.com/shopspring/decimal"
)

type (
	// ID Unique id for the furniture aggregate
	ID string

	CategoryID string

	HouseID string

	// ImageID unique image id for an image associated with a furniture
	ImageID string

	// Furniture ...
	Furniture struct {
		ID             ID
		Name           string
		UID            string
		CategoryID     CategoryID
		Cost           decimal.Decimal
		PurchasedFrom  string
		DatePurchased  time.Time
		HouseID        HouseID
		Turns          int
		Width          string
		Height         string
		ImageID        ImageID
		IsFurnitureSet bool
		Quantity       int
		Notes          string
	}
)
