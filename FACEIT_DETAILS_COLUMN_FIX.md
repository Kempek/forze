# Исправление колонки "Детали" в таблице матчей

## 🎯 Проблема
Колонка "Детали" в таблице матчей не работала - кнопки разворачивания не были кликабельны.

## 🔍 Анализ проблемы

### Причина:
1. **Условие отображения кнопки** - кнопка показывалась только если `hasMaps = true`
2. **Отсутствие деталей карт** - FACEIT матчи не имели поля `maps` из-за проблем с группировкой
3. **Неправильная логика** - кнопка должна показываться для всех FACEIT матчей

### Диагностика:
```javascript
// БЫЛО:
const hasMaps = match.maps && match.maps.length > 0;
{hasMaps && (
  <IconButton onClick={() => toggleRowExpansion(match.id)}>
    {isExpanded ? <ExpandLess /> : <ExpandMore />}
  </IconButton>
)}
```

## ✅ Решение

### 1. **Изменено условие отображения кнопки:**
```javascript
// СТАЛО:
const isFaceitMatch = match.source === 'FACEIT';
{isFaceitMatch && (
  <IconButton onClick={() => toggleRowExpansion(match.id)}>
    {isExpanded ? <ExpandLess /> : <ExpandMore />}
  </IconButton>
)}
```

### 2. **Обновлено содержимое развернутой строки:**
```javascript
// Теперь показывает детали матча для всех FACEIT матчей:
<Typography variant="subtitle2" gutterBottom>
  Детали матча FACEIT:
</Typography>
<Box display="flex" flexWrap="wrap" gap={1}>
  <Chip label={`Формат: ${match.map}`} color="primary" />
  <Chip label={`Счет: ${match.result}`} color={match.wl === 'W' ? "success" : "error"} />
  <Chip label={`Противник: ${match.opponent}`} color="default" />
  <Chip label={`Турнир: ${match.event}`} color="secondary" />
  
  {/* Если есть детали карт, показываем их */}
  {hasMaps && (
    <Box>
      <Typography>Детали карт ({match.maps.length} карт):</Typography>
      {match.maps.map((map, index) => (
        <Chip key={index} label={`${map.map}: ${map.ourScore}-${map.oppScore} ${map.isWin ? 'W' : 'L'}`} />
      ))}
    </Box>
  )}
</Box>
```

## 📊 Результат

### ✅ Что исправлено:
1. **Кнопка разворачивания** - теперь кликабельна для всех FACEIT матчей
2. **Детали матча** - показываются даже если нет деталей карт
3. **Универсальность** - работает для всех FACEIT матчей независимо от наличия деталей

### 🎮 Как использовать:
1. **Найти FACEIT матч** в таблице
2. **Кликнуть на кнопку ▶️** в колонке "Детали"
3. **Просмотреть детали** матча в развернутой строке

### 📋 Отображаемая информация:
- **Формат матча** (Best of 3, Best of 5)
- **Счет** (2:1, 0:2)
- **Противник** (название команды)
- **Турнир** (название события)
- **Детали карт** (если доступны)

## 🎉 Итог
Колонка "Детали" теперь полностью функциональна и предоставляет дополнительную информацию о FACEIT матчах!

