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

class BasketWasPickedUp extends BasketEvent
{
    /**
     * {@inheritdoc}
     */
    public static function deserialize(array $data): self
    {
        return new self(new BasketId($data['basketId']));
    }
}
