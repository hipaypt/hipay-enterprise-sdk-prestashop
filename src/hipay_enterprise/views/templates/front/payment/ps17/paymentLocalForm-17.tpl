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
{include file="$hipay_enterprise_tpl_dir/front/partial/js.strings.tpl"}
<form id="{$localPaymentName|escape:'html':'UTF-8'}-hipay" action="{$action|escape:'html':'UTF-8'}" enctype="application/x-www-form-urlencoded"
      class="form-horizontal hipay-form-17" method="post" name="local"
      autocomplete="off">
    {assign "psVersion" "17"}

    {if !empty($errorMsg)}
        <div id="error-js-oc" style="" class="alert alert-danger">
            <ol>
                {foreach $errorMsg as $msg}
                    <li class="error-oc">{$msg|escape:'html':'UTF-8'}</li>
                {/foreach}
            </ol>
        </div>
    {/if}

    {include file="$hipay_enterprise_tpl_dir/hook/paymentLocalForm.tpl"}
    <input class="ioBB" type="hidden" name="ioBB">
</form>

<script>
    document.addEventListener('DOMContentLoaded', formListener{$localPaymentName|regex_replace:'/[^a-zA-Z0-9]/':""|escape:'html':'UTF-8'}, false);

    function formListener{$localPaymentName|regex_replace:'/[^a-zA-Z0-9]/':""}() {
        $("#{$localPaymentName|escape:'html':'UTF-8'}-hipay").submit(function (e) {
            // prevent form from being submitted 
            e.preventDefault();
            e.stopPropagation();

            if (hiPayInputControl.checkControl('{$localPaymentName|escape:'html':'UTF-8'}')) {
                this.submit();
            }

        });
    }
</script>
