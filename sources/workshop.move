module suimoveworkshop::workshop;

use sui::coin::{Self, Coin, TreasuryCap};

public struct WORKSHOP has drop {}

#[lint_allow(share_owned)]
fun init(otw: WORKSHOP, ctx: &mut TxContext) {
    let (mut treasury_cap, coin_metadata) = coin::create_currency<WORKSHOP>(
        otw,
        0,
        b"WORKSHOP",
        b"SUI Workshop Coin",
        b"SUI Workshop Coin",
        option::none(),
        ctx,
    );

    // Freeze the currency
    transfer::public_freeze_object(coin_metadata);

    coin::mint_and_transfer<WORKSHOP>(
        &mut treasury_cap,
        2_000_000_00, // Total supply (2 Billion with 0 decimals)
        ctx.sender(),
        ctx,
    );
    // Transfer the ownership of the treasury cap to the sender
    transfer::public_transfer(treasury_cap, ctx.sender());
}

// === Public-Mutative Functions ===

public fun burn(cap: &mut TreasuryCap<WORKSHOP>, coin_in: Coin<WORKSHOP>): u64 {
    coin::burn(cap, coin_in)
}

// === Public-Friend Functions ===

public fun mint(
    cap: &mut TreasuryCap<WORKSHOP>,
    value: u64,
    ctx: &mut TxContext,
): Coin<WORKSHOP> {
    coin::mint(cap, value, ctx)
}
