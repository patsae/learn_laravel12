<div class="flex {{ $orientation }} gap-2 {{ $class }}">
    <label for="{{ $id }}">{{ $slot }}</label>
    <input type="text" id="{{ $id }}" name="{{ $id }}" value="{{ $value }}" />
</div>
<script>
    export default {}
</script>
