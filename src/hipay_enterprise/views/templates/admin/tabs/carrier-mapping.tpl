{**
* 2017 HiPay
*
* NOTICE OF LICENSE
*
*
* @author    HiPay <support.wallet@hipay.com>
* @copyright 2017 HiPay
* @license   https://github.com/hipay/hipay-wallet-sdk-prestashop/blob/master/LICENSE.md
*
*}
<div class="panel">
    <form method="post" class="form-horizontal" action="{$smarty.server.REQUEST_URI|escape:'htmlall':'UTF-8'}" id="category_form">
        <table class="table">
            <thead>
            <th>Prestashop carrier</th>
            <th>Order preparation estimate time</th>
            <th>Delivery estimate time</th>
            <th>Hipay carrier mode</th>
            <th>Hipay carrier shipping</th>
            </thead>
            <tbody>
                {foreach $psCarriers as $car}
                    <tr>
                        <td>
                            <input type="hidden" value="{$car["id_carrier"]}" name="ps_map_{$car["id_carrier"]}"/>
                            {$car["name"]}
                        </td>
                        <td>
                            <input type="text" value="{if isset($mappedCarriers[$car["id_carrier"]])}{$mappedCarriers[$car["id_carrier"]]["preparation_eta"]}{/if}" name="ps_map_prep_eta_{$car["id_carrier"]}"/>
                        </td>
                        <td>
                            <input type="text" value="{if isset($mappedCarriers[$car["id_carrier"]])}{$mappedCarriers[$car["id_carrier"]]["delivery_eta"]}{/if}" name="ps_map__delivery_eta_{$car["id_carrier"]}"/>
                        </td>
                        <td>
                            <select name="hipay_map_mode_{$car["id_carrier"]}">
                                {if !isset($mappedCarriers[$car["id_carrier"]])}
                                    <option value="" >{l s="Unclassified" mod="hipay_professional"}</option>
                                {/if}
                                {foreach $hipayCarriers["mode"] as $hpcarmode}
                                    <option {if isset($mappedCarriers[$car["id_carrier"]]) && $mappedCarriers[$car["id_carrier"]]["mode"] eq  $hpcarmode->getCode()} selected {/if} value="{$hpcarmode->getCode()}" >{$hpcarmode->getDisplayName($lang|upper)} </option>
                                {/foreach}
                            </select>
                        </td>
                        <td>
                            <select name="hipay_map_shipping_{$car["id_carrier"]}">
                                {if !isset($mappedCarriers[$car["id_carrier"]])}
                                    <option value="" >{l s="Unclassified" mod="hipay_professional"}</option>
                                {/if}
                                {foreach $hipayCarriers["shipping"] as $hpcarmode}
                                    <option {if isset($mappedCarriers[$car["id_carrier"]]) && $mappedCarriers[$car["id_carrier"]]["shipping"] eq  $hpcarmode->getCode()} selected {/if} value="{$hpcarmode->getCode()}" >{$hpcarmode->getDisplayName($lang|upper)} </option>
                                {/foreach}
                            </select>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <button type="submit" class="btn btn-default pull-left" name="submitCancel"><i
                        class="process-icon-eraser"></i>{l s='Discard changes' mod='hipay_professional'}
                </button>
                <button type="submit" class="btn btn-default btn btn-default pull-right" name="submitCarrierMapping">
                    <i class="process-icon-save"></i>{l s='Save configuration changes' mod='hipay_professional'}
                </button>
            </div>
        </div>
    </form>
</div>