package furniture

import (
	"github.com/shopspring/decimal"
	"time"
)

type (
	FurnitureID string

	CategoryID string

	HouseID string

	FurnitureImageID string

	Furniture struct {
		ID               FurnitureID
		Name             string
		UID              string
		CategoryID       CategoryID
		Cost             decimal.Decimal
		PurchasedFrom    string
		DatePurchased    time.Time
		HouseID          HouseID
		Turns            int
		Width            string
		Height           string
		FurnitureImageID FurnitureImageID
		IsFurnitureSet   bool
		Quantity         int
		Notes            string
	}
)
