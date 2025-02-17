<?php

/*
 * This file is part of the broadway/broadway-demo package.
 *
 * (c) 2020 Broadway project
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

namespace BroadwayDemo\Basket;

use Assert\Assertion as Assert;

final class BasketId
{
    private string $basketId;

    public function __construct(string $basketId)
    {
        Assert::uuid($basketId);

        $this->basketId = $basketId;
    }

    public function __toString(): string
    {
        return $this->basketId;
    }
}
