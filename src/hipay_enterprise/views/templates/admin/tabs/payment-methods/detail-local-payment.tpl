{**
 * HiPay Enterprise SDK Prestashop
 *
 * 2017 HiPay
 *
 * NOTICE OF LICENSE
 *
 * @author    HiPay <support.tpp@hipay.com>
 * @copyright 2017 HiPay
 * @license   https://github.com/hipay/hipay-enterprise-sdk-prestashop/blob/master/LICENSE.md
 *}
<div role="tabpanel" class="tab-pane fade in {if $first} active {/if}" id="{$key|escape:'htmlall':'UTF-8'}">
    <div class="panel">
        <div class="row">
            <h4 class="col-lg-5 col-lg-offset-2">
                {l s=$method["displayNameBO"] mod='hipay_enterprise'}
            </h4>
        </div>
        <div class="row">
            <div class="form-group">
                <label class="control-label col-lg-2">
                    {l s='Activated' mod='hipay_enterprise'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="{$key|escape:'htmlall':'UTF-8'}_activated"
                               id="{$key|escape:'htmlall':'UTF-8'}_activated_on" value="1"
                               {if $method.activated }checked="checked"{/if} >
                        <label for="{$key|escape:'htmlall':'UTF-8'}_activated_on">{l s='Yes' mod='hipay_enterprise'}</label>
                        <input type="radio" name="{$key|escape:'htmlall':'UTF-8'}_activated"
                               id="{$key|escape:'htmlall':'UTF-8'}_activated_off" value="0"
                               {if $method.activated == false }checked="checked"{/if} >
                        <label for="{$key|escape:'htmlall':'UTF-8'}_activated_off">{l s='No' mod='hipay_enterprise'}</label>
                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
        </div>
        {if "displayName"|in_array:$method.displayConfigurationFields}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">{l s='Display name' mod='hipay_enterprise'}</label>
                    <div class="col-lg-3">
                        <input type="text" name="{$key|escape:'htmlall':'UTF-8'}_displayName" value="{$method.displayName|escape:'htmlall':'UTF-8'}"/>
                    </div>
                </div>
            </div>
        {/if}
        <div class="row">
            <div class="form-group">
                <label class="control-label col-lg-2">{l s='Front positioning' mod='hipay_enterprise'}</label>
                <div class="col-lg-1" style='width:45px;'>
                    <input type="text" class="money-type" name="{$key|escape:'htmlall':'UTF-8'}_frontPosition" value="{$method.frontPosition|escape:'htmlall':'UTF-8'}"/>
                </div>
            </div>
        </div>
        <br/>
        {if "minAmount"|in_array:$method.displayConfigurationFields}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">{l s='Minimum order amount' mod='hipay_enterprise'}</label>
                    <div class="input-group col-lg-2">
                        <input type="text" class="money-type" name="{$key|escape:'htmlall':'UTF-8'}_minAmount[EUR]"
                               value="{$method.minAmount.EUR|escape:'htmlall':'UTF-8'}"/>
                        <span class="input-group-addon">{Currency::getDefaultCurrency()->sign|escape:'html':'UTF-8'}</span>
                    </div>
                </div>
            </div>
        {/if}
        {if "maxAmount"|in_array:$method.displayConfigurationFields}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">{l s='Maximum order amount' mod='hipay_enterprise'}</label>
                    <div class="input-group col-lg-2">
                        <input type="text" class="money-type" name="{$key|escape:'htmlall':'UTF-8'}_maxAmount[EUR]"
                               value="{$method.maxAmount.EUR|escape:'htmlall':'UTF-8'}"/>
                        <span class="input-group-addon">{Currency::getDefaultCurrency()->sign|escape:'html':'UTF-8'}</span>
                    </div>
                </div>
            </div>
        {/if}
        {if "electronicSignature"|in_array:$method.displayConfigurationFields}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">
                        {l s='Enable signature electronic' mod='hipay_enterprise'}
                    </label>
                    <div class="input-group col-lg-2">
                        <span class="switch prestashop-switch fixed-width-lg">
                            <input type="radio" name="{$key|escape:'htmlall':'UTF-8'}_electronicSignature"
                                   id="electronic_signature_switchmode_on" value="1"
                                    {if $method.electronicSignature} checked="checked"{/if}>
                            <label for="electronic_signature_switchmode_on">{l s='Yes' mod='hipay_enterprise'}</label>
                            <input type="radio" name="{$key|escape:'htmlall':'UTF-8'}_electronicSignature"
                                   id="electronic_signature_switchmode_off" value="0"
                                   {if $method.electronicSignature  == false}checked="checked"{/if}>
                            <label for="electronic_signature_switchmode_off">{l s='No' mod='hipay_enterprise'}</label>
                            <a class="slide-button btn"></a>
                        </span>
                    </div>
                </div>
            </div>
        {/if}
        {if $method["currencySelectorReadOnly"]}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">{l s='Activated Currencies' mod='hipay_enterprise'}</label>
                    {foreach  $method["currencies"] as $currency }
                        {if isset($limitedCurrencies[$currency])}
                            <span class="label-value col-lg-2">{$limitedCurrencies[$currency]|escape:'htmlall':'UTF-8'}</span>
                            <input type="hidden" value="{$currency|escape:'htmlall':'UTF-8'}" name="{$key|escape:'htmlall':'UTF-8'}_currencies[]"/>
                        {else}
                            <span class="label-value col-lg-3">{$currency|escape:'htmlall':'UTF-8'}
                                {l s='This currency is not activated in your prestashop shop' mod='hipay_enterprise'}
                            </span>
                            <input type="hidden" value="{$currency|escape:'htmlall':'UTF-8'}"
                                   name="{$key|escape:'htmlall':'UTF-8'}_currencies[]"/>
                        {/if}
                    {/foreach}
                </div>
            </div>
        {else}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">{l s='Activated Currencies' mod='hipay_enterprise'}</label>
                    <div class="col-lg-9">
                        <select id="multiselect-{$key|escape:'htmlall':'UTF-8'}" name="{$key|escape:'htmlall':'UTF-8'}_currencies[]" multiple="multiple"
                                class="multiselect-currency">
                            {foreach $limitedCurrencies as $currency }
                                <option value="{$currency@key|escape:'htmlall':'UTF-8'}" {if $currency@key|in_array:$method.currencies } selected {/if} >{$currency@key|escape:'htmlall':'UTF-8'}
                                    - {$currency|escape:'htmlall':'UTF-8'} </option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>
        {/if}

        {if $method["countrySelectorReadOnly"]}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">{l s='Activated Countries' mod='hipay_enterprise'}</label>
                    {foreach  $method["countries"] as $country }
                        {if isset($limitedCountries[$country])}
                            <span class="col-lg-2 label-value">{$limitedCountries[$country]|escape:'htmlall':'UTF-8'}</span>
                            <input type="hidden" readonly value="{$country|escape:'htmlall':'UTF-8'}"
                                   name="{$key|escape:'htmlall':'UTF-8'}_countries[]"/>
                        {else}
                            <span class="label-value col-lg-4">{$country|escape:'htmlall':'UTF-8'}
                                {l s='This country is not activated in your prestashop shop' mod='hipay_enterprise'}
                            </span>
                            <input type="hidden" value="{$country|escape:'htmlall':'UTF-8'}"
                                   name="{$key|escape:'htmlall':'UTF-8'}_countries[]"/>
                        {/if}
                    {/foreach}
                </div>
            </div>
        {else}
            <div class="row">
                <div class="form-group">
                    <label class="control-label col-lg-2">{l s='Countries' mod='hipay_enterprise'}</label>
                    <div class="col-lg-6">
                        <select id="countries_{$key|escape:'htmlall':'UTF-8'}" multiple="multiple" size="10"
                                name="{$key|escape:'htmlall':'UTF-8'}_countries[]">
                            {foreach $limitedCountries as $country}
                                <option value="{$country@key|escape:'htmlall':'UTF-8'}" {if !empty($method.countries) && $country@key|in_array:$method.countries } selected {/if} >{$country|escape:'htmlall':'UTF-8'}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>